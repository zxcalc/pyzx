// Initial wiring: [6, 2, 3, 19, 12, 0, 7, 15, 18, 9, 4, 11, 1, 17, 16, 14, 5, 8, 10, 13]
// Resulting wiring: [6, 2, 3, 19, 12, 0, 7, 15, 18, 9, 4, 11, 1, 17, 16, 14, 5, 8, 10, 13]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[7], q[6];
cx q[8], q[7];
cx q[15], q[13];
cx q[8], q[11];
cx q[3], q[6];
