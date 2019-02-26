// Initial wiring: [0 2 1 3 7 5 4 8 6]
// Resulting wiring: [5 1 2 4 6 0 3 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[6], q[5];
cx q[1], q[2];
cx q[1], q[2];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[1], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[2];
cx q[6], q[7];
cx q[6], q[7];
cx q[3], q[4];
cx q[4], q[7];
cx q[1], q[0];
cx q[4], q[3];
