// Initial wiring: [7, 0, 3, 9, 10, 13, 15, 6, 5, 8, 1, 2, 12, 4, 11, 14]
// Resulting wiring: [7, 0, 3, 9, 10, 13, 15, 6, 5, 8, 1, 2, 12, 4, 11, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[8], q[7];
cx q[12], q[11];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[14];
cx q[6], q[7];
cx q[1], q[6];
cx q[6], q[7];
cx q[7], q[6];
cx q[0], q[1];
