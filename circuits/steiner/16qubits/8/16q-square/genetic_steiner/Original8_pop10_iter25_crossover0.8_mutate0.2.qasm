// Initial wiring: [14, 11, 5, 9, 4, 10, 8, 15, 0, 3, 6, 2, 12, 13, 1, 7]
// Resulting wiring: [14, 11, 5, 9, 4, 10, 8, 15, 0, 3, 6, 2, 12, 13, 1, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[8], q[7];
cx q[9], q[6];
cx q[10], q[9];
cx q[11], q[10];
cx q[10], q[9];
cx q[15], q[14];
cx q[14], q[13];
cx q[15], q[8];
cx q[13], q[12];
cx q[8], q[7];
cx q[14], q[13];
cx q[15], q[14];
cx q[15], q[8];
cx q[14], q[15];
cx q[12], q[13];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[12];
cx q[10], q[13];
cx q[5], q[10];
cx q[10], q[9];
