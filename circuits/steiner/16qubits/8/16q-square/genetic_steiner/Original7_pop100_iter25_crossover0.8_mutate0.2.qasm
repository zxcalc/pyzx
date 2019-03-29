// Initial wiring: [14, 9, 0, 8, 4, 7, 3, 11, 2, 13, 10, 6, 15, 5, 1, 12]
// Resulting wiring: [14, 9, 0, 8, 4, 7, 3, 11, 2, 13, 10, 6, 15, 5, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[8], q[7];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[5];
cx q[9], q[6];
cx q[10], q[5];
cx q[10], q[11];
cx q[4], q[11];
