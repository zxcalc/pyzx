// Initial wiring: [2, 3, 9, 15, 8, 18, 5, 7, 19, 11, 4, 13, 6, 12, 14, 16, 0, 1, 10, 17]
// Resulting wiring: [2, 3, 9, 15, 8, 18, 5, 7, 19, 11, 4, 13, 6, 12, 14, 16, 0, 1, 10, 17]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[4];
cx q[6], q[3];
cx q[18], q[11];
cx q[9], q[11];
cx q[11], q[12];
cx q[8], q[11];
cx q[2], q[3];
