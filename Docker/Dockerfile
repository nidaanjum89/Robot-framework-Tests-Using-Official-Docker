#This docker image is not used to run the tests. The official docker image from robot framework docker hub is used

FROM python:3.9.0-alpine3.12

# Set the reports directory environment variable
ENV ROBOT_REPORTS_DIR /opt/robotframework/Results

# Set the tests directory environment variable
ENV ROBOT_TESTS_DIR /opt/robotframework/Tests

# Set the working directory environment variable
ENV ROBOT_WORK_DIR /opt/robotframework/temp

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

# Setup the timezone to use, defaults to UTC
ENV TZ UTC

# Dependency versions
ENV ALPINE_GLIBC 2.31-r0
ENV AWS_CLI_VERSION 1.20.6
ENV AXE_SELENIUM_LIBRARY_VERSION 2.1.6
ENV CHROMIUM_VERSION 86.0
ENV DATADRIVER_VERSION 1.4.1
ENV DATETIMETZ_VERSION 1.0.6
ENV FAKER_VERSION 5.0.0
ENV FIREFOX_VERSION 78
ENV GECKO_DRIVER_VERSION v0.26.0
ENV REQUESTS_VERSION 0.9.1
ENV ROBOT_FRAMEWORK_VERSION 4.1
ENV SELENIUM_LIBRARY_VERSION 5.1.3


RUN apk update \
  && apk --no-cache upgrade \
  && apk --no-cache --virtual .build-deps add \


    # Continue with system dependencies
    gcc \
    g++ \
    libffi-dev \
    linux-headers \
    make \
    musl-dev \
    openssl-dev \
    which \
    wget \
  && apk --no-cache add \
    "chromium~$CHROMIUM_VERSION" \
    "chromium-chromedriver~$CHROMIUM_VERSION" \
    "firefox-esr~$FIREFOX_VERSION" \
    nodejs \
    nodejs-npm \
    xauth \
    tzdata \
  && mv /usr/lib/chromium/chrome /usr/lib/chromium/chrome-original \
  && ln -sfv /opt/robotframework/bin/chromium-browser /usr/lib/chromium/chrome \
# FIXME: above is a workaround, as the path is ignored

# Install Robot Framework and Selenium Library
  && pip3 install \
    --no-cache-dir \
    robotframework==$ROBOT_FRAMEWORK_VERSION \
    robotframework-datetime-tz==$DATETIMETZ_VERSION \
    robotframework-faker==$FAKER_VERSION \
    robotframework-seleniumlibrary==$SELENIUM_LIBRARY_VERSION \
    axe-selenium-python==$AXE_SELENIUM_LIBRARY_VERSION

# Create the default report and work folders with the default user to avoid runtime issues
# These folders are writeable by anyone, to ensure the user can be changed on the command line.
RUN mkdir -p ${ROBOT_RESULTS_DIR} \
  && mkdir -p ${ROBOT_WORK_DIR} \
  && chown ${ROBOT_UID}:${ROBOT_GID} ${ROBOT_RESULTS_DIR} \
  && chown ${ROBOT_UID}:${ROBOT_GID} ${ROBOT_WORK_DIR} \
  && chmod ugo+w ${ROBOT_RESULTS_DIR} ${ROBOT_WORK_DIR}

# Update system path
ENV PATH=/opt/robotframework/bin:/opt/robotframework/drivers:$PATH

USER ${ROBOT_UID}:${ROBOT_GID}

# A dedicated work folder to allow for the creation of temporary files
WORKDIR ${ROBOT_WORK_DIR}
