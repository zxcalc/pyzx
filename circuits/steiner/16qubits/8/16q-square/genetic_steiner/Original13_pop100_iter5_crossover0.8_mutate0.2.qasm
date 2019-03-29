// Initial wiring: [15, 9, 10, 5, 2, 14, 12, 6, 8, 0, 1, 7, 3, 13, 4, 11]
// Resulting wiring: [15, 9, 10, 5, 2, 14, 12, 6, 8, 0, 1, 7, 3, 13, 4, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[6], q[1];
cx q[8], q[7];
cx q[7], q[6];
cx q[9], q[6];
cx q[6], q[1];
cx q[9], q[6];
cx q[14], q[13];
cx q[15], q[14];
cx q[8], q[15];
cx q[7], q[8];
cx q[8], q[15];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[8];
cx q[13], q[14];
cx q[1], q[6];
