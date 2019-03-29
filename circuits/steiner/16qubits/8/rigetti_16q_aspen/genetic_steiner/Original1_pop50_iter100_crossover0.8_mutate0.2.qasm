// Initial wiring: [2, 8, 7, 0, 11, 6, 5, 15, 9, 13, 10, 4, 3, 14, 1, 12]
// Resulting wiring: [2, 8, 7, 0, 11, 6, 5, 15, 9, 13, 10, 4, 3, 14, 1, 12]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[9], q[8];
cx q[13], q[12];
cx q[15], q[8];
cx q[13], q[14];
cx q[14], q[15];
cx q[15], q[14];
cx q[4], q[5];
cx q[0], q[15];
cx q[15], q[14];
