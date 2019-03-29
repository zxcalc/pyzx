// Initial wiring: [9, 6, 14, 4, 7, 15, 10, 12, 0, 2, 1, 3, 5, 11, 13, 8]
// Resulting wiring: [9, 6, 14, 4, 7, 15, 10, 12, 0, 2, 1, 3, 5, 11, 13, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[1];
cx q[7], q[6];
cx q[9], q[6];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[9];
cx q[9], q[6];
cx q[15], q[14];
cx q[11], q[12];
cx q[5], q[10];
cx q[10], q[11];
cx q[1], q[2];
