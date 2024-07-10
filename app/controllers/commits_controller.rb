class CommitsController < ApplicationController
  before_action :commit_params

  # commit details
  def commit
		commit = CommitService.new(@owner, @repository, @oid).get_commit
		render json: CommitSerializer.new(commit).as_json
	end

  # Get diff between two commits
	def diff
		commit = CommitService.new(@owner, @repository, @oid).commit_diff
		render json: commit
	end

  private
  def commit_params
    @owner = params[:owner]
		@repository = params[:repository]
		@oid = params[:oid]
  end
end
