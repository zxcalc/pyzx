// Initial wiring: [11, 8, 5, 9, 0, 10, 14, 4, 2, 7, 15, 3, 6, 13, 12, 1]
// Resulting wiring: [11, 8, 5, 9, 0, 10, 14, 4, 2, 7, 15, 3, 6, 13, 12, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[3], q[2];
cx q[5], q[4];
cx q[9], q[8];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[8];
cx q[13], q[12];
cx q[8], q[7];
cx q[14], q[13];
cx q[15], q[14];
cx q[15], q[8];
cx q[12], q[13];
cx q[8], q[15];
cx q[0], q[1];
