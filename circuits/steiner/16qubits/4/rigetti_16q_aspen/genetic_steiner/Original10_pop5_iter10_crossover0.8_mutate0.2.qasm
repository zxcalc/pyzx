// Initial wiring: [8, 11, 4, 2, 14, 3, 12, 0, 10, 7, 9, 13, 5, 1, 15, 6]
// Resulting wiring: [8, 11, 4, 2, 14, 3, 12, 0, 10, 7, 9, 13, 5, 1, 15, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[16];
cx q[2], q[1];
cx q[12], q[11];
cx q[13], q[12];
cx q[12], q[11];
cx q[12], q[13];
cx q[11], q[12];
cx q[10], q[11];
cx q[11], q[12];
cx q[12], q[13];
cx q[13], q[14];
cx q[14], q[15];
cx q[13], q[12];
cx q[14], q[13];
cx q[15], q[14];
cx q[1], q[2];
cx q[0], q[15];
cx q[15], q[14];
cx q[0], q[1];
cx q[14], q[13];
cx q[1], q[2];
cx q[2], q[1];
cx q[14], q[15];
cx q[13], q[14];
