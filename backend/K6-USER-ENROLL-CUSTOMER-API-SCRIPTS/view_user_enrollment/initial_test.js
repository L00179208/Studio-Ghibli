import http from 'k6/http';
import { Counter, Rate, Trend, Gauge } from 'k6/metrics';
import { check } from 'k6';


//const requestCount = new Counter('request_count');
const statusCode = new Counter('status_code');
const contentSize = new Gauge('content_size');
//const dataSent = new Counter('data_sent'); 
//const dataReceived = new Counter('data_received');
const successfulChecks = new Rate('successful_checks');

//RED Method
const requestRate = new Rate('request_rate');
const failureRate = new Rate('failure_rate');
const latency = new Trend('latency');

export let options = {
  thresholds: {
    'http_req_duration': ['p(95)<100'], 
    'http_req_failed': ['rate<0.1'], 
    //RED METHOD
    'request_rate': ['rate==1'], 
    'failure_rate': ['rate<0.1'], 
    'latency': ['p(95)<500'], 

  //  'request_count': ['count>=1', 'count<=8'], 
    'status_code': ['count>=0', 'count<=10'],
    'content_size': ['value<=12157'],
    'successful_checks': ['rate>0.9'],
    'http_req_blocked': ['avg<100'],
    'http_req_connecting': ['avg<50'],
    'http_req_tls_handshaking': ['p(95)<500'],
    'http_reqs': ['count>=1', 'count<=10'],
  },
  // Enable metrics collection
  metrics: 'all',
};

export function setup() {
    const urls = Array(9).fill('http://localhost:8883');
    const ids = [];
    const generatedRequests = [];
  
    // Generate multiple IDs and populate executedRequests array
    for (let i = 0; i < 10; i++) {
      const id = Math.floor(Math.random() * 26) + 13;
      const url = urls[Math.floor(Math.random() * urls.length)];
      ids.push(id);
      generatedRequests.push({ url, id });
    }
  
    // Return data for the test
    return { urls, ids, generatedRequests };
}
  


export default function (data) {

  const { generatedRequests } = data;
  
  // Iterate over the generatedRequests array
  for (const request of generatedRequests) {
    const { url, id } = request;

    // Send a GET request with the random ID to the random URL
    const response = http.get(`${url}/${id}`);

    // Record metrics and checks
    recordMetricsAndChecks(response);
  }
    
  }
  

function recordMetricsAndChecks(response) {
  // Check if the response is successful
  const status_success = check(response, {
    'Status is 200': (r) => r.status === 200
  });
  successfulChecks.add(status_success);
  
  // Record latency
  latency.add(response.timings.duration);
  
  // Record failure rate
  failureRate.add(response.status !== 200);
  
  // Record status code count
  statusCode.add(response.status === 200);
  
  // Record content size
  const length = response.headers['Content-Length'];
  contentSize.add(Number(length));
  
  // Record data received
  //dataReceived.add(response.body ? response.body.length : 0);
  
  // Record request count
  requestRate.add(1);
}

export function handleSummary(data) {
 
}

export function teardown(data) {
  const { urls } = data;
  urls.forEach(url => {
    console.log(`REQUEST URL: ${url} CLOSED!`);
});
    
}
