#
# Copyright 2018-2020 Orange
#
# See the NOTICE file distributed with this work for additional information
# regarding copyright ownership.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
FROM nginx
LABEL ngsiagent="pixel"
LABEL ngsiagent.type="daemon"
LABEL ngsiagent.internal.port="80"
LABEL ngsiagent.internal.path="/"
LABEL ngsiagent.external.path="/orion"
LABEL ngsiagent.datasources="[\"urn:pixel:DataSource:proxy\"]"
LABEL ngsiagent.datamodels="[\"/Dummies/minimal-schema.json\"]"
EXPOSE 80
ENV NGINX_HOST 0.0.0.0
ENV NGINX_PORT 80
ENV TARGET 127.0.0.1:1026
ENV FIWARE_SERVICE_PATH /
COPY docker_entrypoint.sh /docker_entrypoint.sh
RUN chmod u+rx /docker_entrypoint.sh
COPY default.conf /etc/nginx/conf.d/default.conf.template
ENTRYPOINT ["/docker_entrypoint.sh"]