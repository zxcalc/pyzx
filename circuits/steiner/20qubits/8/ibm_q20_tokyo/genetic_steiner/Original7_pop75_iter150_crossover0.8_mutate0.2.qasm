// Initial wiring: [3, 12, 6, 13, 10, 11, 19, 2, 8, 18, 5, 15, 9, 7, 17, 1, 0, 14, 4, 16]
// Resulting wiring: [3, 12, 6, 13, 10, 11, 19, 2, 8, 18, 5, 15, 9, 7, 17, 1, 0, 14, 4, 16]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[4], q[3];
cx q[5], q[3];
cx q[3], q[2];
cx q[6], q[3];
cx q[9], q[8];
cx q[12], q[11];
cx q[10], q[11];
