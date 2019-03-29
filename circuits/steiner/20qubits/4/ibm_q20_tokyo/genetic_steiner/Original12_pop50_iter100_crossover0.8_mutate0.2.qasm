// Initial wiring: [2, 19, 13, 11, 18, 0, 9, 17, 15, 3, 10, 4, 1, 5, 7, 6, 8, 14, 16, 12]
// Resulting wiring: [2, 19, 13, 11, 18, 0, 9, 17, 15, 3, 10, 4, 1, 5, 7, 6, 8, 14, 16, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[14], q[15];
cx q[12], q[13];
cx q[4], q[6];
cx q[3], q[6];
