// Initial wiring: [0, 12, 4, 17, 3, 15, 16, 7, 2, 1, 8, 19, 13, 11, 18, 9, 5, 6, 14, 10]
// Resulting wiring: [0, 12, 4, 17, 3, 15, 16, 7, 2, 1, 8, 19, 13, 11, 18, 9, 5, 6, 14, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[9], q[0];
cx q[17], q[18];
cx q[6], q[7];
cx q[3], q[5];
