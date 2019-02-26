// Initial wiring: [0 1 2 3 4 6 5 7 8]
// Resulting wiring: [0 2 1 3 7 6 5 4 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[3], q[2];
cx q[4], q[7];
cx q[4], q[7];
cx q[4], q[7];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[4];
cx q[0], q[1];
cx q[5], q[4];
