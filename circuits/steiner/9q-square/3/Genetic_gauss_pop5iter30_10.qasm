// Initial wiring: [0 1 2 5 3 6 4 7 8]
// Resulting wiring: [0 4 2 5 3 6 1 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[5], q[4];
cx q[4], q[3];
