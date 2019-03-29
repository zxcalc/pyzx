// Initial wiring: [4, 10, 15, 1, 12, 6, 13, 0, 11, 3, 7, 14, 9, 2, 8, 5]
// Resulting wiring: [4, 10, 15, 1, 12, 6, 13, 0, 11, 3, 7, 14, 9, 2, 8, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[8], q[7];
cx q[13], q[12];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[15];
cx q[13], q[14];
cx q[14], q[15];
cx q[15], q[14];
cx q[12], q[13];
cx q[2], q[3];
cx q[0], q[15];
