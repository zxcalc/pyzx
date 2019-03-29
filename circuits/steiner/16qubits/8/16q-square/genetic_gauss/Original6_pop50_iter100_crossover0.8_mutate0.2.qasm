// Initial wiring: [1, 10, 12, 15, 2, 7, 0, 8, 13, 5, 3, 11, 9, 4, 6, 14]
// Resulting wiring: [1, 10, 12, 15, 2, 7, 0, 8, 13, 5, 3, 11, 9, 4, 6, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[9], q[2];
cx q[8], q[4];
cx q[15], q[4];
cx q[14], q[11];
cx q[8], q[12];
cx q[1], q[3];
cx q[3], q[14];
