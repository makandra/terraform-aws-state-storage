
# Contributing 

When contributing to this repository, please first discuss the change you wish to make by opening an issue, and link the pull request.

# Chores
Please read and execute the following tasks, if appropriate, when making a new pull request.

* Verify checkov passes
  * We use [checkov](https://www.checkov.io/) as static code analyzer. You can run checkov locally in docker to avoid installing it, by executing the following command at the repository root level:
    ```sh
    docker run -it --rm --workdir /share -v $PWD:/share:ro bridgecrew/checkov:latest --quiet --compact --directory /share
    ``` 
* Update `README.md`
   * We use `terraform-docs` to create part of the documentation. If you made changes to the terraform code please execute the following command to update the [README.md](README.md):
      ```sh
      terraform-docs --output-file README.md markdown .
      ```
