// Initial wiring: [14, 9, 5, 12, 10, 3, 13, 4, 0, 1, 11, 6, 7, 15, 2, 8]
// Resulting wiring: [14, 9, 5, 12, 10, 3, 13, 4, 0, 1, 11, 6, 7, 15, 2, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[7], q[0];
cx q[14], q[15];
cx q[12], q[13];
cx q[7], q[8];
cx q[4], q[5];
cx q[2], q[5];
cx q[2], q[3];
