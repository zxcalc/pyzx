// Initial wiring: [3, 11, 4, 0, 15, 10, 14, 1, 13, 12, 7, 8, 5, 6, 2, 9]
// Resulting wiring: [3, 11, 4, 0, 15, 10, 14, 1, 13, 12, 7, 8, 5, 6, 2, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[7], q[6];
cx q[6], q[5];
cx q[7], q[0];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[0];
cx q[8], q[7];
cx q[9], q[6];
cx q[9], q[8];
cx q[6], q[5];
cx q[10], q[5];
cx q[14], q[9];
cx q[9], q[8];
cx q[15], q[14];
cx q[14], q[15];
cx q[13], q[14];
cx q[10], q[11];
cx q[9], q[14];
cx q[14], q[15];
cx q[15], q[14];
cx q[8], q[15];
cx q[1], q[6];
cx q[6], q[7];
cx q[1], q[2];
