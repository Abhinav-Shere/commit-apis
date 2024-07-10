class CommitService
  BASE_URL = "https://api.github.com/repos"

  def initialize(owner, repository, oid)
    @owner = owner
    @repository = repository
    @oid = oid
  end

  def get_commit
    make_github_api_request("#{commit_url}/#{@oid}")
  end

  def commit_diff
    make_github_api_request("#{commit_url}/#{@oid}/diff")
  end

  private

  def commit_url
    "#{BASE_URL}/#{@owner}/#{@repository}/commits"
  end

  def make_github_api_request(url)
    begin
      response = RestClient.get(url)
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      handle_rest_client_exception(e)
    rescue StandardError => e
      handle_standard_error(e)
    end
  end

  def handle_rest_client_exception(e)
    { error: e.response.body, status: e.http_code }
  end

  def handle_standard_error(e)
    { error: e.message, status: :internal_server_error }
  end
end


