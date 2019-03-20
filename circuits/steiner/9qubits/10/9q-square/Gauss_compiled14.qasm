// Initial wiring: [0 1 2 4 7 5 6 3 8]
// Resulting wiring: [0 1 2 3 7 4 6 5 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[5], q[0];
cx q[5], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[3], q[4];
cx q[4], q[5];
cx q[0], q[5];
cx q[0], q[1];
cx q[3], q[4];
