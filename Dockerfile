FROM ubuntu
RUN adduser runnerboy
COPY . /app/
RUN apt-get update
RUN apt-get install -y curl

RUN apt-get install -y tar
RUN apt-get install -y libdigest-sha-perl
WORKDIR /app
RUN curl https://github.com/weisser-dev/github-actions-runner-docker/.install_runner.sh
RUN chmod +x ./install_runner.sh
RUN ./install_runner.sh
ENV DEBIAN_FRONTEND=noninteractive
RUN ./bin/installdependencies.sh
RUN mkdir _diag
RUN chown -R runnerboy /app
USER runnerboy
ARG GITHUB_REPO_URL
# getting repo token from here: https://github.com/<your_repo>/settings/actions/runners/new?arch=x64&os=linux #every token is just 1 time valid...
ARG GITHUB_REPO_TOKEN 
RUN if [[ -z "$GITHUB_REPO_URL" ]] ; then echo Argument not provided, build fail ; else echo Argument exists ; fi
RUN if [[ -z "$GITHUB_REPO_TOKEN" ]] ; then echo Argument not provided, build fail ; else echo Argument exists ; fi
RUN ./config.sh --url https://github.com/$GITHUB_REPO_URL --token $GITHUB_REPO_TOKEN
ENTRYPOINT [ "./run.sh" ]