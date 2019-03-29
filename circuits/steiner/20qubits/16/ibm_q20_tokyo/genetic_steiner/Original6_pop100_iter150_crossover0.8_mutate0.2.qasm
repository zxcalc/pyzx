// Initial wiring: [10, 2, 16, 6, 13, 18, 12, 3, 14, 1, 5, 4, 9, 11, 19, 0, 7, 15, 17, 8]
// Resulting wiring: [10, 2, 16, 6, 13, 18, 12, 3, 14, 1, 5, 4, 9, 11, 19, 0, 7, 15, 17, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[7], q[6];
cx q[7], q[1];
cx q[10], q[9];
cx q[11], q[10];
cx q[13], q[6];
cx q[14], q[5];
cx q[15], q[13];
cx q[13], q[6];
cx q[17], q[12];
cx q[19], q[18];
cx q[11], q[12];
cx q[12], q[13];
cx q[12], q[11];
cx q[6], q[12];
cx q[12], q[11];
cx q[11], q[12];
cx q[2], q[3];
