require 'spec_helper'

describe ProjectsController do
  describe "Inherited Resources" do
    before :each do
      @current_site = mock_model(Site)
      Site.stub!(:with_language).and_return([@current_site])
      @projects = []
      5.times { @projects << mock_model(Person, site: @current_site) }
      @recent_jobs = @projects[-3, 3]
      project = mock("project", :all => @projects,:recent_jobs => @recent_jobs)
      @current_site.stub!(:projects).and_return(project)
    end

    describe  "GET#list" do
      it "assigns the current site's projects to @projects" do
        get :list
        assigns(:projects).should eq @projects
      end

      it "renders the list template" do
        get :list
        response.should render_template :list
      end
    end

    describe  "GET#index" do
      before :each do
        @current_site.stub!(:projects_by_created_date => sorted_projects)
        @current_site.stub!(:featured_projects => highlighted_projects)
      end

      let(:sorted_projects)      { @projects.sample(3) }
      let(:highlighted_projects) { @projects[1,2] }

      it "assigns the current site's recent jobs to @recent_jobs" do
        @current_site.should_receive(:projects)
        @current_site.projects.should_receive(:recent_jobs)
        get :index
        assigns(:recent_jobs).should eq @recent_jobs
      end

      it "assigns @projects with the projects of current site sorted descendingly by creation date " do
        @current_site.should_receive(:projects_by_created_date)
        get :index
        assigns(:projects).should eq sorted_projects
      end

      it "assigns the current site's highlighted projects to @highlighted_projects" do
        @current_site.should_receive(:featured_projects)
        get :index
        assigns(:highlighted_projects).should eq highlighted_projects
      end

      it "renders the index template" do
        get :index
        response.should render_template :index
      end
    end

    describe "GET#show" do
      before :each do
        @technologies = mock('Technology association',
          by_position: [mock_model(Technology)])
        @tools        = mock('Technology association',
          by_position: [mock_model(Tool)])

        @project = mock_model(Project, technologies: @technologies,
          tools: @tools)

        @current_site.stub!(:projects)
          .and_return(mock("project", find: @project))
      end

      it "assigns the project's technologies to @technologies" do
        @technologies.should_receive(:by_position)

        get :show, id: @project

        assigns(:technologies).should eq @technologies.by_position
      end

      it "assigns the project's tools to @tools" do
        @tools.should_receive(:by_position)

        get :show, id: @project

        assigns(:tools).should eq @tools.by_position
      end

      it "renders the index template" do
        get :show, id: @project
        response.should render_template :show
      end
    end
  end
end