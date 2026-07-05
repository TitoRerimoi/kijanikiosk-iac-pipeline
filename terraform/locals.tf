locals {
  servers = {
    api = {
      name = "kijanikiosk-api"
      role = "api"
    }

    payments = {
      name = "kijanikiosk-payments"
      role = "payments"
    }

    logs = {
      name = "kijanikiosk-logs"
      role = "logs"
    }
  }
}