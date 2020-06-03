FROM alpine:3

#--------------------------------------------#
# Install std build packages, git and awscli #
#--------------------------------------------#

RUN apk add --update --no-cache bash ca-certificates curl git jq openssh py-pip && \
    pip install -U awscli && \
    apk --purge -v del py-pip && \
    rm -rf `find / -regex '.*\.py[co]'`

COPY ["src", "/src/"]

ENTRYPOINT ["/src/main.sh"]
