#Extension builder - https://k6.io/docs/extensions
FROM golang:1.18.1 as builder
 
RUN go install go.k6.io/xk6/cmd/xk6@latest
RUN xk6 build v0.38.3 --output /k6 --with github.com/avitalique/xk6-file --with github.com/szkiba/xk6-dotenv
 
FROM loadimpact/k6:latest
COPY --from=builder /k6 /usr/bin/k6