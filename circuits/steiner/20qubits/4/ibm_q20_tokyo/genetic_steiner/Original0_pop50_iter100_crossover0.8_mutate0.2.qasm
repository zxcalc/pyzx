// Initial wiring: [17, 8, 15, 0, 4, 6, 5, 19, 12, 16, 10, 9, 18, 3, 11, 7, 13, 2, 14, 1]
// Resulting wiring: [17, 8, 15, 0, 4, 6, 5, 19, 12, 16, 10, 9, 18, 3, 11, 7, 13, 2, 14, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[16], q[15];
cx q[7], q[13];
cx q[4], q[6];
cx q[3], q[5];
