# TrustBridge Protocol

## Next-Generation Philanthropic Infrastructure Built on Bitcoin's Foundation

TrustBridge transforms global philanthropy by creating a transparent, accountable ecosystem where every charitable contribution is tracked through Bitcoin-secured smart contracts. This protocol establishes verifiable impact chains, connecting generous donors with verified causes while ensuring funds reach their intended beneficiaries.

## 🌟 Key Features

- **Bitcoin-Anchored Security**: Built on Stacks blockchain with Bitcoin's security guarantees
- **Complete Transparency**: Every donation and fund utilization is immutably recorded
- **Role-Based Access Control**: Structured permissions for admins, moderators, and beneficiaries
- **Impact Tracking**: Milestone-based fund utilization with approval workflows
- **Institutional-Grade Accountability**: Verifiable audit trails for all transactions

## 🏗️ Architecture Overview

### System Components

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│     Donors      │    │  Beneficiaries  │    │  Administrators │
│                 │    │                 │    │                 │
│ • Make donations│    │ • Receive funds │    │ • Manage system │
│ • Track impact  │    │ • Report usage  │    │ • Approve usage │
└─────────┬───────┘    └─────────┬───────┘    └─────────┬───────┘
          │                      │                      │
          └──────────────────────┼──────────────────────┘
                                 │
                    ┌────────────▼────────────┐
                    │   TrustBridge Protocol  │
                    │                         │
                    │ • Role Management       │
                    │ • Beneficiary Registry  │
                    │ • Donation Processing   │
                    │ • Utilization Tracking │
                    └─────────────────────────┘
```

### Contract Architecture

The TrustBridge Protocol is organized into five core modules:

#### 1. **Role Management System**
- **Purpose**: Manages user permissions and access levels
- **Roles**: Admin (1), Moderator (2), Beneficiary (3)
- **Functions**: `set-role`, `remove-role`

#### 2. **Beneficiary Registry**
- **Purpose**: Maintains verified charitable organizations
- **Data**: Name, description, funding targets, received amounts
- **Functions**: `register-beneficiary`, `get-beneficiary`

#### 3. **Donation Processing**
- **Purpose**: Handles STX transfers and donation tracking
- **Features**: Automatic fund allocation, transaction logging
- **Functions**: `donate`, `get-donation-by-id`, `get-donation-count`

#### 4. **Utilization Tracking**
- **Purpose**: Monitors how funds are used by beneficiaries
- **Features**: Milestone-based reporting, approval workflows
- **Functions**: `add-utilization`, `approve-utilization`, `get-utilization-by-id`

#### 5. **Access Control & Security**
- **Purpose**: Ensures only authorized users can perform sensitive operations
- **Features**: Role-based permissions, ownership validation

## 📊 Data Flow

### Donation Flow
```
1. Donor initiates donation
   ↓
2. System validates beneficiary exists
   ↓
3. STX transfer executed
   ↓
4. Donation recorded in ledger
   ↓
5. Beneficiary's received amount updated
```

### Utilization Flow
```
1. Admin adds utilization record
   ↓
2. System creates milestone entry
   ↓
3. Admin reviews and approves utilization
   ↓
4. Utilization status updated to "approved"
```

## 🔧 Smart Contract Functions

### Public Functions

#### Role Management
- `set-role(user: principal, new-role: uint)` - Assign role to user
- `remove-role(user: principal)` - Remove user role

#### Beneficiary Management
- `register-beneficiary(name, description, target-amount)` - Register new charity
- `get-beneficiary(id)` - Retrieve beneficiary information

#### Donation Processing
- `donate(beneficiary-id, amount)` - Process donation
- `get-donation-by-id(donation-id)` - Retrieve donation details
- `get-donation-count()` - Get total donations

#### Utilization Tracking
- `add-utilization(beneficiary-id, description, amount)` - Record fund usage
- `approve-utilization(utilization-id, beneficiary-id)` - Approve usage
- `get-utilization-by-id(utilization-id)` - Get utilization details
- `get-utilization-count()` - Get total utilizations

### Error Codes

| Code | Constant | Description |
|------|----------|-------------|
| 100 | ERR-NOT-AUTHORIZED | User lacks required permissions |
| 101 | ERR-ALREADY-REGISTERED | Entity already exists |
| 102 | ERR-NOT-FOUND | Requested entity not found |
| 103 | ERR-INSUFFICIENT-FUNDS | Insufficient balance for operation |
| 104 | ERR-BENEFICIARY-NOT-FOUND | Beneficiary does not exist |
| 105 | ERR-UTILIZATION-NOT-FOUND | Utilization record not found |
| 106 | ERR-INVALID-INPUT | Invalid input parameters |

## 🚀 Getting Started

### Prerequisites
- Stacks blockchain access
- Clarity smart contract development environment
- STX tokens for transactions

### Deployment
1. Deploy the contract to Stacks testnet/mainnet
2. Initialize with contract owner as admin
3. Set up moderator accounts for beneficiary registration
4. Begin onboarding charitable organizations

### Usage Examples

#### Register a Beneficiary (Moderator)
```clarity
(contract-call? .trustbridge register-beneficiary 
  u"Local Food Bank" 
  u"Providing meals to families in need" 
  u1000000) ;; 1 STX target
```

#### Make a Donation
```clarity
(contract-call? .trustbridge donate u1 u100000) ;; 0.1 STX to beneficiary #1
```

#### Track Fund Utilization (Admin)
```clarity
(contract-call? .trustbridge add-utilization 
  u1 
  u"Purchased food supplies for 100 families" 
  u50000) ;; 0.05 STX utilized
```

## 🛡️ Security Features

- **Role-Based Access Control**: Granular permissions prevent unauthorized actions
- **Fund Validation**: Ensures sufficient funds before approvals
- **Immutable Records**: All transactions permanently recorded on blockchain
- **Owner Protection**: Contract owner cannot be removed or modified

## 🌍 Impact & Vision

TrustBridge Protocol represents a paradigm shift in charitable giving, where:
- **Donors** gain unprecedented visibility into their impact
- **Beneficiaries** access funding with built-in accountability
- **Administrators** maintain oversight without compromising transparency
- **Society** benefits from more efficient, trustworthy philanthropy

Every transaction tells a story of hope, backed by Bitcoin's security and Stacks' smart contract capabilities.

## 📄 License

This project is open source. Please refer to the license file for details.

## 🤝 Contributing

We welcome contributions to improve TrustBridge Protocol. Please follow our contribution guidelines and code of conduct.
