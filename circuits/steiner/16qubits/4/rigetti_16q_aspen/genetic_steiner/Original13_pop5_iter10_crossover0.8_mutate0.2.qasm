// Initial wiring: [5, 15, 10, 3, 2, 8, 13, 4, 6, 1, 11, 7, 12, 9, 0, 14]
// Resulting wiring: [5, 15, 10, 3, 2, 8, 13, 4, 6, 1, 11, 7, 12, 9, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[4], q[3];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[9];
cx q[9], q[8];
cx q[8], q[7];
cx q[9], q[8];
cx q[10], q[9];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[13];
cx q[15], q[14];
cx q[6], q[7];
