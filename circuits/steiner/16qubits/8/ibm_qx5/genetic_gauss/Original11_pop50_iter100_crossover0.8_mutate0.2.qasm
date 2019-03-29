// Initial wiring: [11, 9, 15, 0, 5, 3, 14, 13, 4, 2, 6, 10, 7, 8, 1, 12]
// Resulting wiring: [11, 9, 15, 0, 5, 3, 14, 13, 4, 2, 6, 10, 7, 8, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[6], q[1];
cx q[9], q[1];
cx q[10], q[1];
cx q[14], q[0];
cx q[13], q[5];
cx q[12], q[7];
cx q[0], q[3];
