// Initial wiring: [17, 9, 13, 10, 3, 1, 6, 18, 7, 2, 0, 12, 8, 11, 14, 19, 4, 15, 16, 5]
// Resulting wiring: [17, 9, 13, 10, 3, 1, 6, 18, 7, 2, 0, 12, 8, 11, 14, 19, 4, 15, 16, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[11], q[8];
cx q[16], q[15];
cx q[19], q[18];
cx q[3], q[5];
