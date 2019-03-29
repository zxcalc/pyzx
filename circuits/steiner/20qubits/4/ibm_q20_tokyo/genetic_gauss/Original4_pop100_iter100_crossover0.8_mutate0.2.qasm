// Initial wiring: [1, 6, 19, 13, 7, 17, 2, 9, 11, 16, 18, 12, 14, 3, 15, 4, 8, 0, 10, 5]
// Resulting wiring: [1, 6, 19, 13, 7, 17, 2, 9, 11, 16, 18, 12, 14, 3, 15, 4, 8, 0, 10, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[0];
cx q[19], q[6];
cx q[9], q[18];
cx q[9], q[17];
