FROM pyhf/pyhf-validation-root-base:root6.20.00-python3.7

LABEL "com.github.actions.name"="pyhf Validation Actions"
LABEL "com.github.actions.description"="GitHub Action for using pyhf in validation workflows"
LABEL "com.github.actions.icon"="database"
LABEL "com.github.actions.color"="blue"

LABEL version="0.0.1"
LABEL repository="https://github.com/pyhf/pyhf-validation-github-action"
LABEL homepage="https://github.com/pyhf/pyhf-validation-github-action"

RUN apt-get -qq -y update && \
    apt-get -qq --no-install-recommends -y install \
      git && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt-get/lists/* && \
    python -m pip install --upgrade --no-cache-dir pip setuptools wheel

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
