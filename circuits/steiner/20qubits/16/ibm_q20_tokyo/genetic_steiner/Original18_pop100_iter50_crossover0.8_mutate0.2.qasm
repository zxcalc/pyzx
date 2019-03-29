// Initial wiring: [14, 0, 1, 16, 18, 19, 15, 12, 13, 3, 7, 17, 2, 6, 9, 10, 11, 5, 8, 4]
// Resulting wiring: [14, 0, 1, 16, 18, 19, 15, 12, 13, 3, 7, 17, 2, 6, 9, 10, 11, 5, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[2], q[1];
cx q[4], q[3];
cx q[6], q[5];
cx q[6], q[3];
cx q[7], q[6];
cx q[6], q[3];
cx q[9], q[0];
cx q[13], q[6];
cx q[14], q[5];
cx q[15], q[13];
cx q[13], q[7];
cx q[7], q[1];
cx q[13], q[6];
cx q[18], q[12];
cx q[12], q[6];
cx q[12], q[7];
cx q[6], q[3];
cx q[7], q[1];
cx q[12], q[6];
cx q[12], q[7];
cx q[19], q[18];
cx q[8], q[10];
cx q[0], q[1];
