// Initial wiring: [8, 3, 12, 4, 14, 13, 5, 1, 7, 0, 9, 2, 6, 11, 15, 10]
// Resulting wiring: [8, 3, 12, 4, 14, 13, 5, 1, 7, 0, 9, 2, 6, 11, 15, 10]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[5], q[2];
cx q[6], q[5];
cx q[5], q[2];
cx q[6], q[5];
cx q[13], q[12];
cx q[15], q[14];
cx q[14], q[15];
cx q[10], q[11];
cx q[9], q[14];
cx q[14], q[13];
cx q[13], q[12];
cx q[14], q[15];
cx q[12], q[13];
cx q[5], q[10];
cx q[10], q[11];
cx q[4], q[11];
