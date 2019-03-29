// Initial wiring: [0, 13, 9, 12, 18, 16, 5, 15, 2, 7, 11, 8, 14, 3, 1, 19, 4, 10, 6, 17]
// Resulting wiring: [0, 13, 9, 12, 18, 16, 5, 15, 2, 7, 11, 8, 14, 3, 1, 19, 4, 10, 6, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[8], q[7];
cx q[10], q[9];
cx q[14], q[13];
cx q[15], q[13];
cx q[10], q[19];
cx q[8], q[11];
cx q[0], q[1];
