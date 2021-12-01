FROM envoyproxy/envoy:v1.14.2
CMD /usr/local/bin/envoy -c /etc/envoy.yaml -l debug --service-cluster proxy
