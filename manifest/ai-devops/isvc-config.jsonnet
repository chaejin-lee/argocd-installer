{
  "apiVersion": "v1",
  "data": {
    "agent": std.join("", ["{\n    \"image\" : \"", target_registry, "docker.io/kfserving/agent:v0.5.1\",\n    \"memoryRequest\": \"100Mi\",\n    \"memoryLimit\": \"1Gi\",\n    \"cpuRequest\": \"100m\",\n    \"cpuLimit\": \"1\"\n}"]),
    "batcher": std.join("", ["{\n    \"image\" : \"", target_registry, "docker.io/kfserving/agent:v0.5.1\",\n    \"memoryRequest\": \"1Gi\",\n    \"memoryLimit\": \"1Gi\",\n    \"cpuRequest\": \"1\",\n    \"cpuLimit\": \"1\"\n}"]),
    "credentials": "{\n   \"gcs\": {\n       \"gcsCredentialFileName\": \"gcloud-application-credentials.json\"\n   },\n   \"s3\": {\n       \"s3AccessKeyIDName\": \"AWS_ACCESS_KEY_ID\",\n       \"s3SecretAccessKeyName\": \"AWS_SECRET_ACCESS_KEY\"\n   }\n}",
    "explainers": std.join("", ["{\n    \"alibi\": {\n        \"image\" : \"", target_registry, "docker.io/kfserving/alibi-explainer\",\n        \"defaultImageVersion\": \"v0.5.1\"\n    },\n    \"aix\": {\n        \"image\" : \"", target_registry, "docker.io/kfserving/aix-explainer\",\n        \"defaultImageVersion\": \"v0.5.1\"\n    },\n    \"art\": {\n        \"image\" : \"", target_registry, "docker.io/kfserving/art-explainer\",\n        \"defaultImageVersion\": \"v0.5.1\"\n    }\n}"]),
    "ingress": "{\n    \"ingressGateway\" : \"kubeflow-gateway.kubeflow\",\n    \"ingressService\" : \"istio-ingressgateway.istio-system.svc.cluster.local\",\n    \"localGateway\" : \"cluster-local-gateway.knative-serving\",\n    \"localGatewayService\" : \"cluster-local-gateway.istio-system.svc.cluster.local\"\n}",
    "logger": std.join("", ["{\n    \"image\" : \"", target_registry, "docker.io/kfserving/agent:v0.5.1\",\n    \"memoryRequest\": \"100Mi\",\n    \"memoryLimit\": \"1Gi\",\n    \"cpuRequest\": \"100m\",\n    \"cpuLimit\": \"1\",\n    \"defaultUrl\": \"http://default-broker\"\n}"]),
    "predictors": std.join("", ["{\n    \"tensorflow\": {\n        \"image\": \"", target_registry, "docker.io/tensorflow/serving\",\n        \"defaultImageVersion\": \"1.14.0\",\n        \"defaultGpuImageVersion\": \"1.14.0-gpu\",\n        \"defaultTimeout\": \"60\",\n        \"supportedFrameworks\": [\n          \"tensorflow\"\n        ],\n        \"multiModelServer\": false\n    },\n    \"onnx\": {\n        \"image\": \"", target_registry, "mcr.microsoft.com/onnxruntime/server\",\n        \"defaultImageVersion\": \"v1.0.0\",\n        \"supportedFrameworks\": [\n          \"onnx\"\n        ],\n        \"multiModelServer\": false\n    },\n    \"sklearn\": {\n      \"v1\": {\n        \"image\": \"", target_registry, "docker.io/kfserving/sklearnserver\",\n        \"defaultImageVersion\": \"v0.5.1\",\n        \"supportedFrameworks\": [\n          \"sklearn\"\n        ],\n        \"multiModelServer\": false\n      },\n      \"v2\": {\n        \"image\": \"", target_registry, "docker.io/seldonio/mlserver\",\n        \"defaultImageVersion\": \"0.2.1\",\n        \"supportedFrameworks\": [\n          \"sklearn\"\n        ],\n        \"multiModelServer\": false\n      }\n    },\n    \"xgboost\": {\n      \"v1\": {\n        \"image\": \"", target_registry, "docker.io/kfserving/xgbserver\",\n        \"defaultImageVersion\": \"v0.5.1\",\n        \"supportedFrameworks\": [\n          \"xgboost\"\n        ],\n        \"multiModelServer\": false\n      },\n      \"v2\": {\n        \"image\": \"", target_registry, "docker.io/seldonio/mlserver\",\n        \"defaultImageVersion\": \"0.2.1\",\n        \"supportedFrameworks\": [\n          \"xgboost\"\n        ],\n        \"multiModelServer\": false\n      }\n    },\n    \"pytorch\": {\n      \"v1\" : {\n        \"image\": \"", target_registry, "docker.io/kfserving/pytorchserver\",\n        \"defaultImageVersion\": \"v0.5.1\",\n        \"defaultGpuImageVersion\": \"v0.5.1-gpu\",\n        \"supportedFrameworks\": [\n          \"pytorch\"\n        ],\n        \"multiModelServer\": false\n      },\n      \"v2\" : {\n        \"image\": \"", target_registry, "docker.io/kfserving/torchserve-kfs\",\n        \"defaultImageVersion\": \"0.3.0\",\n        \"defaultGpuImageVersion\": \"0.3.0-gpu\",\n        \"supportedFrameworks\": [\n          \"pytorch\"\n        ],\n        \"multiModelServer\": false\n      }\n    },\n    \"triton\": {\n        \"image\": \"", target_registry, "nvcr.io/nvidia/tritonserver\",\n        \"defaultImageVersion\": \"20.08-py3\",\n        \"supportedFrameworks\": [\n          \"tensorrt\",\n          \"tensorflow\",\n          \"onnx\",\n          \"pytorch\",\n          \"caffe2\"\n        ],\n        \"multiModelServer\": true\n    },\n    \"pmml\": {\n        \"image\": \"", target_registry, "docker.io/kfserving/pmmlserver\",\n        \"defaultImageVersion\": \"v0.5.1\",\n        \"supportedFrameworks\": [\n          \"pmml\"\n        ],\n        \"multiModelServer\": false\n    },\n    \"lightgbm\": {\n        \"image\": \"", target_registry, "docker.io/kfserving/lgbserver\",\n        \"defaultImageVersion\": \"v0.5.1\",\n        \"supportedFrameworks\": [\n          \"lightgbm\"\n        ],\n        \"multiModelServer\": false\n    }\n}"]),
    "storageInitializer": std.join("", ["{\n    \"image\" : \"", target_registry, "docker.io/kfserving/storage-initializer:v0.5.1\",\n    \"memoryRequest\": \"100Mi\",\n    \"memoryLimit\": \"1Gi\",\n    \"cpuRequest\": \"100m\",\n    \"cpuLimit\": \"1\"\n}"]),
    "transformers": "{\n}"
  },
  "kind": "ConfigMap",
  "metadata": {
    "labels": {
      "app": "kfserving",
      "app.kubernetes.io/component": "kfserving",
      "app.kubernetes.io/name": "kfserving",
      "kustomize.component": "kfserving"
    },
    "name": "inferenceservice-config",
    "namespace": ai_devops_namespace
  }
},