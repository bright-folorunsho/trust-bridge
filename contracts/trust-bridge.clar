;; Title: TrustBridge Protocol
;;
;; Summary: 
;; Next-Generation Philanthropic Infrastructure Built on Bitcoin's Foundation
;;
;; Description: 
;; TrustBridge transforms global philanthropy by creating a transparent,
;; accountable ecosystem where every charitable contribution is tracked through
;; Bitcoin-secured smart contracts. This protocol establishes verifiable impact
;; chains, connecting generous donors with verified causes while ensuring funds
;; reach their intended beneficiaries. By leveraging Stacks' Bitcoin anchoring,
;; TrustBridge provides institutional-grade transparency with unprecedented
;; accountability, making charitable giving more efficient, trustworthy, and
;; impactful than ever before. Every transaction tells a story of hope.

;; CORE SYSTEM CONSTANTS & ERROR DEFINITIONS

;; Contract ownership management
(define-data-var contract-owner principal tx-sender)

;; System error codes for comprehensive error handling
(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-REGISTERED (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-BENEFICIARY-NOT-FOUND (err u104))
(define-constant ERR-UTILIZATION-NOT-FOUND (err u105))
(define-constant ERR-INVALID-INPUT (err u106))

;; Role-based access control levels
(define-constant ROLE-ADMIN u1)
(define-constant ROLE-MODERATOR u2)
(define-constant ROLE-BENEFICIARY u3)

;; DATA STRUCTURES & STORAGE ARCHITECTURE

;; User role management system
(define-map roles
  { user: principal }
  { role: uint }
)

;; Charitable organization registry
(define-map beneficiaries
  { id: uint }
  {
    name: (string-utf8 50),
    description: (string-utf8 255),
    target-amount: uint,
    received-amount: uint,
    status: (string-ascii 20),
  }
)

;; Donation transaction ledger
(define-map donations
  { id: uint }
  {
    donor: principal,
    beneficiary-id: uint,
    amount: uint,
    timestamp: uint,
  }
)

;; Fund utilization tracking system
(define-map utilization
  { id: uint }
  {
    beneficiary-id: uint,
    milestone: uint,
    description: (string-utf8 255),
    amount: uint,
    status: (string-ascii 20),
  }
)

;; GLOBAL STATE VARIABLES

;; Entity counter management
(define-data-var beneficiary-count uint u0)
(define-data-var donation-count uint u0)
(define-data-var utilization-count uint u0)

;; UTILITY FUNCTIONS

;; Authorization check function
(define-private (is-authorized
    (user principal)
    (required-role uint)
  )
  (let ((role-data (default-to { role: u0 } (map-get? roles { user: user }))))
    (>= (get role role-data) required-role)
  )
)

;; Milestone counter helper
(define-private (get-last-milestone (beneficiary-id uint))
  (var-get utilization-count)
)