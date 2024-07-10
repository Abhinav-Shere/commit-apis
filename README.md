Dependencies

Ruby Version: 3.0.4
Rails Version: 6.0.6.1

Setup Instructions

bundle install

Run the Application: rails s


API Integration Details
Commit Details API:

Verified and operational.


Commit Diff API Issue:

There is a known issue with the GitHub API (https://api.github.com/repos/{owner}/{repository}/commits/{oid}/diff).
Attempts with different repositories, owners, and commit SHAs result in a consistent error: "No commit found for SHA, 422."
Comparison API Attempt:

Integration of the comparison API (https://api.github.com/repos/OWNER/REPO/compare/BASEHEAD) also results in the same 422 error.
Detailed documentation for these APIs can be found here.