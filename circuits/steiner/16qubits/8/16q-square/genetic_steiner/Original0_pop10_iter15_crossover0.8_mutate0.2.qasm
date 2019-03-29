// Initial wiring: [9, 7, 10, 1, 6, 5, 4, 13, 11, 15, 0, 14, 3, 12, 8, 2]
// Resulting wiring: [9, 7, 10, 1, 6, 5, 4, 13, 11, 15, 0, 14, 3, 12, 8, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[4];
cx q[11], q[4];
cx q[13], q[12];
cx q[12], q[11];
cx q[13], q[12];
cx q[14], q[13];
cx q[13], q[10];
cx q[14], q[13];
cx q[15], q[14];
cx q[14], q[13];
cx q[13], q[10];
cx q[14], q[13];
cx q[15], q[14];
cx q[12], q[13];
cx q[10], q[11];
cx q[9], q[14];
cx q[5], q[10];
cx q[10], q[11];
cx q[1], q[2];
