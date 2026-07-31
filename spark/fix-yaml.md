

1. 修改 Master 的 StatefulSet
找到 # Source: spark/templates/statefulset-master.yaml，修改 Pod 層級的 fsGroup 以及 Container 層級的 runAsUser / runAsGroup：

      # 找到這段 Pod 層級的 securityContext (約在第 215 行附近)
      securityContext:
        fsGroup: 1002          # <-- 改成 1002
        fsGroupChangePolicy: Always
        supplementalGroups: []
        sysctls: []
      containers:
        - name: spark-master
          ...
          # 找到這段 Container 層級的 securityContext (約在第 230 行附近)
          securityContext:
            allowPrivilegeEscalation: false
            capabilities:
              drop:
              - ALL
            privileged: false
            readOnlyRootFilesystem: true
            runAsGroup: 1002   # <-- 改成 1002
            runAsNonRoot: true
            runAsUser: 1002    # <-- 改成 1002
            seLinuxOptions: {}
            seccompProfile:
              type: RuntimeDefault

...


2. 修改 Worker 的 StatefulSet
找到 # Source: spark/templates/statefulset-worker.yaml，同樣修改 Pod 與 Container 層級：

      # 找到這段 Pod 層級的 securityContext (約在第 355 行附近)
      securityContext:
        fsGroup: 1002          # <-- 改成 1002
        fsGroupChangePolicy: Always
        seLinuxOptions: {}
        supplementalGroups: []
        sysctls: []
      containers:
        - name: spark-worker
          ...
          # 找到這段 Container 層級的 securityContext (約在第 370 行附近)
          securityContext:
            allowPrivilegeEscalation: false
            capabilities:
              drop:
              - ALL
            privileged: false
            readOnlyRootFilesystem: true
            runAsGroup: 1002   # <-- 改成 1002
            runAsNonRoot: true
            runAsUser: 1002    # <-- 改成 1002
            seLinuxOptions: {}
            seccompProfile:
              type: RuntimeDefault



kubectl apply -f spark-manifest.yaml




