// Initial wiring: [14, 2, 12, 0, 13, 4, 9, 11, 8, 15, 10, 1, 6, 5, 3, 7]
// Resulting wiring: [14, 2, 12, 0, 13, 4, 9, 11, 8, 15, 10, 1, 6, 5, 3, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[5], q[2];
cx q[10], q[9];
cx q[11], q[4];
cx q[13], q[10];
cx q[10], q[5];
cx q[5], q[4];
cx q[10], q[5];
cx q[13], q[10];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[9];
cx q[10], q[13];
cx q[10], q[11];
cx q[8], q[15];
cx q[6], q[7];
cx q[7], q[8];
