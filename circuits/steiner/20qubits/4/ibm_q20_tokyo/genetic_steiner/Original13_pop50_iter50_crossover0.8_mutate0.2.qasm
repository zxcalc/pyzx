// Initial wiring: [0, 5, 7, 19, 11, 17, 16, 10, 4, 14, 15, 3, 9, 12, 18, 8, 13, 2, 6, 1]
// Resulting wiring: [0, 5, 7, 19, 11, 17, 16, 10, 4, 14, 15, 3, 9, 12, 18, 8, 13, 2, 6, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[19], q[18];
cx q[15], q[16];
cx q[14], q[16];
cx q[9], q[11];
