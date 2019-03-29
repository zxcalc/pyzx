// Initial wiring: [14, 0, 13, 5, 2, 7, 12, 15, 1, 9, 6, 8, 11, 10, 4, 3]
// Resulting wiring: [14, 0, 13, 5, 2, 7, 12, 15, 1, 9, 6, 8, 11, 10, 4, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[13], q[12];
cx q[12], q[11];
cx q[11], q[4];
cx q[12], q[11];
cx q[14], q[1];
cx q[15], q[14];
cx q[6], q[7];
cx q[1], q[2];
