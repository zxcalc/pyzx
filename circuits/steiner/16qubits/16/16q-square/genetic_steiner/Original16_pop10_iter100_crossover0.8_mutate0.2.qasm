// Initial wiring: [2, 13, 14, 10, 12, 11, 4, 7, 8, 0, 1, 5, 3, 15, 6, 9]
// Resulting wiring: [2, 13, 14, 10, 12, 11, 4, 7, 8, 0, 1, 5, 3, 15, 6, 9]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[7], q[6];
cx q[10], q[5];
cx q[5], q[2];
cx q[2], q[1];
cx q[5], q[2];
cx q[13], q[10];
cx q[10], q[9];
cx q[9], q[6];
cx q[14], q[9];
cx q[14], q[13];
cx q[9], q[6];
cx q[13], q[10];
cx q[14], q[9];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[15], q[14];
cx q[14], q[15];
cx q[6], q[9];
cx q[2], q[3];
cx q[1], q[6];
