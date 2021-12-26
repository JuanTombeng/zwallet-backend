const connection = require('../config/dbConfig.js')

const createTransaction = (data) => {
    return new Promise ((resolve, reject) => {
        const sql = `INSERT INTO transactions SET ?`
        connection.query(sql, data, (error, result) => {
            if (!error) {
                resolve(result)
            } else {
                reject(error)
            }
        })
    })
}

const getTransactions = ({sort, order, limit, offset}) => {
    return new Promise ((resolve, reject) => {
        let sql = `SELECT users.username, transactions.from_account_id, transactions.to_account_id, transactions.amount, transactions.created_at 
                FROM users INNER JOIN accounts ON users.id = accounts.id_user 
                INNER JOIN transactions ON accounts.id = transactions.from_account_id`
        if (order) {
            sql += ` ORDER BY ${order} ${sort} LIMIT ${limit} OFFSET ${offset}`
        }
        connection.query(sql, (error, result) => {
            if (!error) {
                resolve(result)
            } else {
                reject(error)
            }
        })
    })
}

const countTransactions = () => {
    return new Promise ((resolve, reject) => {
        const sql = `SELECT COUNT(*) AS total FROM transactions`
        connection.query(sql, (error, result) => {
            if (!error) {
                resolve(result)
            } else {
                reject(error)
            }
        })
    })
}

const updateTransaction = (transactionId, data) => {
    return new Promise ((resolve, reject) => {
        const sql = `UPDATE transactions SET ? WHERE id = ?`
        connection.query(sql, [data, transactionId], (error, result) => {
            if (!error) {
                resolve(result)
            } else {
                reject(error)
            }
        })
    })
}

module.exports = {
    createTransaction,
    getTransactions,
    countTransactions,
    updateTransaction
}
